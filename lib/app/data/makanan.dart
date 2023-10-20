class Makanan {
  final String judul;
  final String gambar;
  final String kalori;
  final String waktu;
  final String review;
  final String bintang;

  Makanan(
      {required this.judul,
      required this.gambar,
      required this.kalori,
      required this.waktu,
      required this.review,
      required this.bintang});

  List<Makanan> detailMakanan = [];
}

var detailMakanan = [
  Makanan(
      judul: 'Ramen Noodle',
      gambar:
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      kalori: '120',
      waktu: '15',
      review: '(23 Reviews)',
      bintang: '4.4/5'),
  Makanan(
      judul: 'Beef Steak',
      gambar:
          'https://images.unsplash.com/photo-1600891964092-4316c288032e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YmVlZiUyMHN0ZWFrfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      kalori: '140',
      waktu: '25',
      review: '(23 Reviews)',
      bintang: '4.4/5'),
  Makanan(
      judul: 'Butter Chicken',
      gambar:
          'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnV0dGVyJTIwY2hpY2tlbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
      kalori: '130',
      waktu: '16',
      review: '(18 Reviews)',
      bintang: '4.2/5'),
  Makanan(
      judul: 'Butter Chicken',
      gambar:
          'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnV0dGVyJTIwY2hpY2tlbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
      kalori: '130',
      waktu: '16',
      review: '(18 Reviews)',
      bintang: '4.2/5')
];
