// class UserAPIModel {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;

//   UserAPIModel({
//     this.id,
//     this.name,
//     this.username,
//     this.email,
//     this.address,
//     this.phone,
//     this.website,
//     this.company,
//   });

//   factory UserAPIModel.fromJson(Map<String, dynamic> json) {
//     return UserAPIModel(
//       id: json['id'],
//       name: json['name'],
//       username: json['username'],
//       email: json['email'],
//       address: json['address'] != null
//           ? Address.fromJson(json['address'])
//           : null,
//       phone: json['phone'],
//       website: json['website'],
//       company: json['company'] != null
//           ? Company.fromJson(json['company'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'username': username,
//       'email': email,
//       'address': address?.toJson(),
//       'phone': phone,
//       'website': website,
//       'company': company?.toJson(),
//     };
//   }
// }

// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       street: json['street'],
//       suite: json['suite'],
//       city: json['city'],
//       zipcode: json['zipcode'],
//       geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'street': street,
//       'suite': suite,
//       'city': city,
//       'zipcode': zipcode,
//       'geo': geo?.toJson(),
//     };
//   }
// }

// class Geo {
//   String? lat;
//   String? lng;

//   Geo({this.lat, this.lng});

//   factory Geo.fromJson(Map<String, dynamic> json) {
//     return Geo(lat: json['lat'], lng: json['lng']);
//   }

//   Map<String, dynamic> toJson() {
//     return {'lat': lat, 'lng': lng};
//   }
// }

// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;

//   Company({this.name, this.catchPhrase, this.bs});

//   factory Company.fromJson(Map<String, dynamic> json) {
//     return Company(
//       name: json['name'],
//       catchPhrase: json['catchPhrase'],
//       bs: json['bs'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
//   }
// }
