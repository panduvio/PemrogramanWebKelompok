class RekomendasiEntity {
  final String namaPekerjaan;
  final String rekomendasi1;
  final String rekomendasi2;

  RekomendasiEntity({
    required this.namaPekerjaan,
    required this.rekomendasi1,
    required this.rekomendasi2,
  });
}

List<RekomendasiEntity> rekomList = [
  RekomendasiEntity(
      namaPekerjaan: 'DevOps Engineer',
      rekomendasi1: 'assets/dev_ops_1_1.png',
      rekomendasi2: 'assets/bussiness_analyst_2_1.png'),
  RekomendasiEntity(
      namaPekerjaan: 'Data Science',
      rekomendasi1: 'assets/python.png',
      rekomendasi2: 'assets/machine_learning.png'),
  RekomendasiEntity(
      namaPekerjaan: 'Web Designing',
      rekomendasi1: 'assets/web_designer_1_1.png',
      rekomendasi2: 'assets/web_designer_2_1.png'),
  RekomendasiEntity(
      namaPekerjaan: 'Java Developer',
      rekomendasi1: 'assets/java_1_1.png',
      rekomendasi2: 'assets/java_2_1.png'),
  RekomendasiEntity(
      namaPekerjaan: 'Business Analyst',
      rekomendasi1: 'assets/business_analyst_1_1.png',
      rekomendasi2: 'assets/business_analyst_2_1.png'),
  RekomendasiEntity(
      namaPekerjaan: 'Operation Manager',
      rekomendasi1: 'assets/operation_manager_1_1.png',
      rekomendasi2: 'assets/operation_manager_2_1.png'),
];
