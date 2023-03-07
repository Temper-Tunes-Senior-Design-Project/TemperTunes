enum FileType
{
  MP4,
  JPEG,
}
extension FileTypeExtension on FileType
{
  static Map<FileType, String> encodings =
  {
    FileType.MP4: "video/mp4",
    FileType.JPEG: "image/jpeg",
};

  static Map<FileType, String> postfix =
  {
    FileType.MP4: "mp4",
    FileType.JPEG: "jpg",
  };

   String getEncoding()
   {
     return encodings[this]??"";
   }

   String getPostfix()
   {
     return postfix[this]??"jpg";
   }

}