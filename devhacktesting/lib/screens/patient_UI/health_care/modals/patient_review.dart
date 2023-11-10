class ReviewModel {
  String patientName;
  String date;
  int starNum;
  String patientReview;

//Constructor
  ReviewModel({
    required this.patientName,
    required this.date,
    required this.starNum,
    required this.patientReview,
  });

  //
  static List<ReviewModel> getReview() {
    // ignore: non_constant_identifier_names
    List<ReviewModel> ReviewList = [];

    ReviewList.add(ReviewModel(
        patientName: 'Siti Aisyah binti Mohd',
        date: '7th November 2023',
        starNum: 3,
        patientReview:
            'Patient review: I was totally impressed by the way I was treated first time when I met him in 2008 and the way he followed up. He is not only an Excellent Doctor , he is simple, superb Human being, Sober, approachable, a Great Social Worker, friendly approach with smiling face with his selfless service with his selfless services.'));

    ReviewList.add(ReviewModel(
        patientName: 'Tan Wei Jie',
        date: '15th April 2024',
        starNum: 4,
        patientReview:
            "I was thoroughly impressed with the quality of care I received here. The medical team was knowledgeable and compassionate, making me feel comfortable throughout my treatment. I'm giving them a well-deserved 5-star rating."));

    ReviewList.add(ReviewModel(
        patientName: 'Ahmad bin Abdullah',
        starNum: 5,
        date: '22nd September 2024',
        patientReview: 'Great'));

    return ReviewList;
  }
}
