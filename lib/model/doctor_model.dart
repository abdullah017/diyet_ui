class Doctor {
  final String name;
  final String specialist;
  final String about;
  final double rating;
  final String reviews;
  final String academy;
  final String image;
  Doctor(
      {this.academy,
      this.name,
      this.about,
      this.rating,
      this.reviews,
      this.specialist,
      this.image});
}

class Consultation {
  final String title;
  final String subtitle;
  final String price;
  Consultation({this.price, this.subtitle, this.title});
}

List<Consultation> consultationList = [
  Consultation(
    title: "Cardio Issues?",
    price: "100",
    subtitle:
        "For cardio patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Dental trouble?",
    price: "80",
    subtitle:
        "For dental patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Heart Issues?",
    price: "250",
    subtitle:
        "For heart patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Eyes Issues?",
    price: "500",
    subtitle:
        "For eyes patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Therapist?",
    price: "50",
    subtitle:
        "For therapist patient here can easily contact with doctor. Can chat & live chat.",
  ),
];
List<Doctor> doctorList = [
  Doctor(
      name: "Dyt. Dilan Kara",
      about:
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac. ",
      rating: 4.0,
      reviews: "80",
      specialist: "Diyabet ve diğer hastalıklarda beslenme",
      academy: "Harvard Medical College Hospital",
      image:
          "assets/5-Ways-to-Help-Employees-Choose-the-Right-Primary-Care-Doctor--e1543342970537.jpg"),
  Doctor(
      name: "Uzm.Dyt. Mahmut Ak",
      about:
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac. ",
      rating: 4.0,
      reviews: "27",
      specialist: "Bariatrik cerrahi sonrası beslenme",
      academy: "Dhaka Medical College Hospital",
      image: "assets/92019175-happy-doctor-with-clipboard-at-clinic.jpg"),
  Doctor(
      name: "Dyt. Feride Karpınar",
      about:
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac. ",
      rating: 4.9,
      reviews: "27",
      specialist: "Vejeteryan beslenme",
      academy: "Los Angeles Medical College Hospital",
      image: "assets/doctor-in-branding-article.jpg"),
  Doctor(
      name: "Dyt. Şeyma Erbaş",
      about:
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac. ",
      rating: 4.5,
      reviews: "27",
      specialist: "Sağlıklı kilo alma",
      academy: "Miami Medical College Hospital",
      image: "assets/file-20191203-66986-im7o5.jpg"),
  Doctor(
      name: "Dyt. Hayley Williams",
      about:
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac. ",
      rating: 4.9,
      reviews: "27",
      specialist: "Cardiologist",
      academy: "New York Medical College Hospital",
      image: "assets/file-20191203-66986-im7o5.jpg"),
  Doctor(
      name: "Dyt. Sakura Miyawaki",
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit hendrerit nulla ut viverra. Phasellus consectetur tellus tortor, vitae elementum nibh tincidunt sed. Sed in ex sit amet lacus tempus congue ullamcorper vel nisi. Nunc nec vulputate quam. Fusce porttitor consectetur augue et commodo. Vivamus a mauris leo. Vestibulum id faucibus sapien, quis tincidunt libero. Mauris vel eleifend massa, nec gravida felis. Vivamus vel blandit est, sed euismod justo. Morbi eget libero ligula. Vivamus leo ipsum, placerat eget auctor sed, semper nec arcu. Duis ultricies pulvinar tellus sed vestibulum. Donec blandit tempor neque ut mattis. Vivamus facilisis quis justo vel gravida. Mauris congue vestibulum mauris, et malesuada lectus aliquet ac.",
      rating: 4.9,
      reviews: "27",
      specialist: "Cardiologist",
      academy: "Tokyo University Medical College Hospital",
      image: "assets/national-doctors-day-1-920x518.jpg"),
];
