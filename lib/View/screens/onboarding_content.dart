class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: ' ',
      image: 'assets/images/1.svg',
      discription: 'Grow your skill & push your limit'),
  UnbordingContent(
      title: ' ',
      image: 'assets/images/2.svg',
      discription: 'Study from anywhere with experts'),
  UnbordingContent(
      title: ' ',
      image: 'assets/images/3.svg',
      discription: 'Get access to unlimited educational resources'),
  UnbordingContent(
      title: ' AcadeMade',
      image: 'assets/images/2.svg',
      discription:
          'Find the best courses & upgrade your skills, start learn now with'),
];
