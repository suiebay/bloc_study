import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  Profile(this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
