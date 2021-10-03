class CakupanModel {
  int? vaksinasi1;
  int? vaksinasi2;

  CakupanModel({
    this.vaksinasi1,
    this.vaksinasi2,
  });

  CakupanModel.fromJson(Map<String, dynamic> json) {
    vaksinasi1 = json['vaksinasi1'];
    vaksinasi2 = json['vaksinasi1'];
  }

  Map<String, dynamic> toJson() {
    return {
      'vaksinasi1': vaksinasi1,
      'vaksinasi2': vaksinasi2,
    };
  }
}
