

class Member{
  int id;
  String nom;
  String lastname;
  String email;
  bool ispayer;
  bool present;
  String chaptername;
  Member({required this.id,required this.nom,required this.lastname,required this.email,required this.ispayer,
  required this.present,required this.chaptername});

  factory Member.fromJson(Map<String,dynamic> json){
    return Member(
      id: json['id'],
      nom: json['nom'], 
      lastname: json['lastname'],
       email: json['email'], 
       ispayer: json['ispayer'], 
       present: json['present'], 
       chaptername: json['chaptername']) ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'lastname': lastname,
      'email': email,
      'ispayer': ispayer,
      'present': present,
      'chaptername': chaptername,
    };
  }
  @override
  String toString() {
    return nom;
  }
}