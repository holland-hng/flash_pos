import 'package:core_data/core_data.dart';
part 'customer_dao.g.dart';

@HiveType(typeId: HiveIdentify.customerId)
class CustomerDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String address;
  @HiveField(5)
  final int loyaltyPoint;

  CustomerDao(this.id, this.name, this.email, this.phoneNumber, this.address,
      this.loyaltyPoint);
}
