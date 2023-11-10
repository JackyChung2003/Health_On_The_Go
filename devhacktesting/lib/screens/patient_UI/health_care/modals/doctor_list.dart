class DoctorModel {
  String DoctorImg;
  String DoctorName;
  String DoctorSpecialist;
  String DoctorDescription;

//Constructor
  DoctorModel({
    required this.DoctorImg,
    required this.DoctorName,
    required this.DoctorSpecialist,
    required this.DoctorDescription,
  });

  //
  static List<DoctorModel> getDoctor() {
    // ignore: non_constant_identifier_names
    List<DoctorModel> DoctorList = [];

    DoctorList.add(DoctorModel(
        DoctorImg: 'lib/images/LimBoonXiong.jpg',
        DoctorName: 'Dr Lim Boon Xiong',
        DoctorSpecialist: 'Cardiologist',
        DoctorDescription:
            'Experienced, talented, blabla...related experience and description, Experienced, talented, blabla...related experience and description'));

    DoctorList.add(DoctorModel(
        DoctorImg: 'lib/images/SiddharthaMukherjee.jpg',
        DoctorName: 'Dr. Siddhartha Mukherjee',
        DoctorSpecialist: 'Gastroenterologist',
        DoctorDescription:
            'Experienced, talented, blabla...related experience and description, Experienced, talented, blabla...related experience and description'));

    DoctorList.add(DoctorModel(
        DoctorImg: 'lib/images/NareshTrehan.jpg',
        DoctorName: 'Dr. Naresh Trehan',
        DoctorSpecialist: 'General practitioner',
        DoctorDescription:
            'Experienced, talented, blabla...related experience and description, Experienced, talented, blabla...related experience and description'));

    DoctorList.add(DoctorModel(
        DoctorImg: 'lib/images/MohdFaizalZainalAbidin.jpg',
        DoctorName: 'Dr Mohd Faizal Zainal Abidin',
        DoctorSpecialist: 'Endocrinologist',
        DoctorDescription:
            'Experienced, talented, blabla...related experience and description, Experienced, talented, blabla...related experience and description'));

    return DoctorList;
  }
}
