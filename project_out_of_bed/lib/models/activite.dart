class Activite {
  final String imagePath;        
  final String title;            
  final String description;      
  final List<Map<String, String>> info; // clés/valeurs (pour durée, lieu, niveau de foule)
  final double? latitude;        
  final double? longitude;   
  int likeCount;
  int saveCount;        

  Activite({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.info,
    this.latitude,
    this.longitude,
    this.likeCount = 0,
    this.saveCount = 0,
  });
}
