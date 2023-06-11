import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:ticket_service/ticket_service.dart';

@injectable
class PickProductHandler {
  final TicketItem ticketItem;

  @factoryMethod
  PickProductHandler(
    @factoryParam this.ticketItem,
  ) {
    ticketItem.pickedDetailsMap.forEach((key, option) {
      pickOptionDetailsHandlerMap[option.id] = PickOptionDetailsHandler(
        callBack: onPickProductDetail,
        optionMode: option.mode,
        rxPickedDetails: RxList<ProductOptionDetail>(option.details),
        productOptionId: option.id,
      );
    });
  }

  void onPickProductDetail(
      String productOptionId, List<ProductOptionDetail> details) {
    rxPickedDetails.update(
      productOptionId,
      (value) => value.clone(
        details: details,
      ),
    );
  }

  Map<String, PickOptionDetailsHandler> pickOptionDetailsHandlerMap = {};

  late String note = ticketItem.note;
  late Rx<int> rxQuantity = Rx<int>(ticketItem.quantity);
  late RxMap<String, ProductOption> rxPickedDetails =
      RxMap<String, ProductOption>(
    ticketItem.pickedDetailsMap,
  );

  late RxCombine<double> rxPrice = RxCombine<double>(
    rxs: [rxQuantity, rxPickedDetails],
    combiner: (rxs) {
      final quantity = (rxs[0] as Rx<int>).value;
      final options = (rxs[1] as RxMap<String, ProductOption>);
      double subPrice = 0;
      options.forEach((key, option) {
        for (final detail in option.details) {
          subPrice += detail.price;
        }
      });
      final result = quantity * (ticketItem.product.price + subPrice);
      return result;
    },
  );

  void increaseQuantity() {
    if (rxQuantity >= 99) {
      return;
    }
    rxQuantity.value += 1;
  }

  void decreaseQuantity() {
    if (rxQuantity <= 1) {
      return;
    }
    rxQuantity.value -= 1;
  }

  TicketItem get result {
    return ticketItem.clone(
      quantity: rxQuantity.value,
      pickedDetailsMap: rxPickedDetails,
      note: note,
    );
  }
}

class PickOptionDetailsHandler {
  final OptionMode optionMode;
  final String productOptionId;
  final RxList<ProductOptionDetail> rxPickedDetails;
  final Function(String, List<ProductOptionDetail>) callBack;

  PickOptionDetailsHandler({
    required this.optionMode,
    required this.rxPickedDetails,
    required this.callBack,
    required this.productOptionId,
  });

  bool isPicked(ProductOptionDetail detail) {
    return rxPickedDetails.contains(detail);
  }

  void pickDetail(ProductOptionDetail detail) {
    switch (optionMode) {
      case OptionMode.single:
        rxPickedDetails.clear();
        rxPickedDetails.add(detail);
        break;
      case OptionMode.multi:
        if (rxPickedDetails.contains(detail)) {
          rxPickedDetails.remove(detail);
        } else {
          rxPickedDetails.add(detail);
        }
        break;
      default:
        throw UnimplementedError();
    }
    callBack.call(productOptionId, rxPickedDetails);
  }
}
