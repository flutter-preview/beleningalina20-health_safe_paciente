class BackUrls {
  BackUrls({
    this.success,
    this.pending,
    this.failure,
  });

  String? success;
  String? pending;
  String? failure;

  factory BackUrls.fromJson(Map<String, dynamic> json) => BackUrls(
        success: json["success"],
        pending: json["pending"],
        failure: json["failure"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pending": pending,
        "failure": failure,
      };
}
