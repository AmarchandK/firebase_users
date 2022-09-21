class Details {
  String? name;
  String? mob;
  String? age;
  String? email;
  String? id;
  Details({this.age, this.email, this.mob, this.name, this.id});
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
        name: json['name'],
        age: json['age'],
        mob: json['mob'],
        id: json['id'],
        email: json['email']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'mob': mob,
        'id': id,
        'email': email,
      };
}
