class HospitalModel {
  String hospitalImg;
  String hospitalName;
  String hospitalAddress;

//Constructor
  HospitalModel({
    required this.hospitalImg,
    required this.hospitalName,
    required this.hospitalAddress,
  });

  //
  static List<HospitalModel> getHospital() {
    // ignore: non_constant_identifier_names
    List<HospitalModel> HospitalList = [];

    HospitalList.add(HospitalModel(
        hospitalImg: 'lib/images/HospitalLamWahEe.jpeg',
        hospitalName: 'Loh Guan Lye Specialists Centre',
        hospitalAddress:
            '238, Jln Macalister, 10400 George Town, Pulau Pinang'));

    HospitalList.add(HospitalModel(
        hospitalImg: 'lib/images/HospitalLohGuanLye.jpeg',
        hospitalName: 'Lam Wah Ee Hospital',
        hospitalAddress:
            '141, Jalan Tan Sri Teh Ewe Lim Jelutong, 11600 George Town, Pulau Pinang'));

    HospitalList.add(HospitalModel(
        hospitalImg: 'lib/images/HospitalPenangAdventist.jpeg',
        hospitalName: 'Penang Adventist Hospital',
        hospitalAddress: '465, Jalan Burma, 10350 George Town, Pulau Pinang'));

    return HospitalList;
  }
}
