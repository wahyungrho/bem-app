class NotulenModel {
  final String? id;
  final String? tema;
  final String? subtema;
  final String? tglRapat;
  final String? time;
  final String? lokasi;
  final String? createdBy;
  final String? createdAt;
  final String? status;
  final String? jumlahKehadiran;
  final String? pimpinanRapat;
  final String? notulenContent;
  final String? createdNotulen;

  NotulenModel(
      {this.id,
      this.tema,
      this.subtema,
      this.tglRapat,
      this.time,
      this.lokasi,
      this.createdBy,
      this.createdAt,
      this.status,
      this.jumlahKehadiran,
      this.pimpinanRapat,
      this.notulenContent,
      this.createdNotulen});

  factory NotulenModel.fromJson(Map<String, dynamic> data) {
    return NotulenModel(
      id: data['id'],
      tema: data['tema'],
      subtema: data['subtema'],
      tglRapat: data['tgl_rapat'],
      time: data['time'],
      lokasi: data['lokasi'],
      createdBy: data['created_by'],
      createdAt: data['created_at'],
      status: data['status'],
      jumlahKehadiran: data['jumlah_kehadiran'],
      pimpinanRapat: data['pimpinan_rapat'],
      notulenContent: data['notulen_content'],
      createdNotulen: data['createdNotulen'],
    );
  }
}
