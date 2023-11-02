class PertanyaanEntity {
  final String pertanyaan;
  final List<String> listJawab;

  PertanyaanEntity({
    required this.pertanyaan,
    required this.listJawab,
  });
}

List<PertanyaanEntity> pertanyaanList = [
  PertanyaanEntity(
    pertanyaan: 'Apakah anda memahami penggunaan API dalam Java Developer?',
    listJawab: [
      'Tidak bisa sama sekali',
      'Hanya sekedar mengetahui',
      'Sedikit menguasai',
      'Cukup menguasai',
      'Sangat menguasai',
    ],
  ),
  PertanyaanEntity(
    pertanyaan: 'Apakah anda memahami garis besar mengenai Java Developer?',
    listJawab: [
      'Tidak bisa sama sekali',
      'Hanya sekedar mengetahui',
      'Sedikit menguasai',
      'Cukup menguasai',
      'Sangat menguasai',
    ],
  ),
  PertanyaanEntity(
    pertanyaan: 'Apakah anda memahami tahapan membuat proyekJava Developer?',
    listJawab: [
      'Tidak bisa sama sekali',
      'Hanya sekedar mengetahui',
      'Sedikit menguasai',
      'Cukup menguasai',
      'Sangat menguasai',
    ],
  ),
];
