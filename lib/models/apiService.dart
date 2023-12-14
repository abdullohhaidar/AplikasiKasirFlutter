class apiService {
  String? message;
  List<Data>? data;

  apiService({this.message, this.data});

  apiService.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  String? deskripsi;
  String? harga;
  String? imageUrl;

  Data(
      {this.id,
      this.nama,
      this.deskripsi,
      this.harga,
      this.imageUrl,});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['deskripsi'] = this.deskripsi;
    data['harga'] = this.harga;
    data['image_url'] = this.imageUrl;
    return data;
  }
}