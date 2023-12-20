class Template {
  String tempName;
  String imgPath;

  Template({
    required this.tempName,
    required this.imgPath,
  });
}

class TemplateModel {
  static List<Template> getTemplate() {
    return [
      Template(
        tempName: 'Business Card Template',
        imgPath: 'assets/temp_1.png',
      ),
      Template(
        tempName: 'Business Card 2',
        imgPath: 'assets/temp_1.png',
      ),
      Template(
        tempName: 'Business Card 3',
        imgPath: 'assets/temp_1.png',
      ),
    ];
  }
}
