class AppUrls {
  static var baseUrl = "https://advo.xeetechpk.com/api/";
  static var loginApi = "${baseUrl}login";
  static var updateTokenApi = "${baseUrl}update/token";
  static var deleteApi = "${baseUrl}account/delete";


  // Admin Urls
static var blogslistApi ="${baseUrl}blogs?page=";
static var blogsAddApi ="${baseUrl}blogs";
static var singleBlogsApi ="${baseUrl}blogs/";
static var categorylistApi ="${baseUrl}categories";
static var requestServicesListApi ="${baseUrl}services/list/therapist";
static var deleteCategoryApi ="${baseUrl}categories/";
static var specialityListApi = "${baseUrl}specialities";
static var acceptRejectRequestApi = "${baseUrl}services/therapist/status";
static var servicesListApi = "${baseUrl}services";
static var deleteSpecialityApi = "${baseUrl}specialities/";
static var articlesApi = "${baseUrl}articles?page=";
static var addArticlesApi = "${baseUrl}articles";
static var updateArticlesApi = "${baseUrl}articles/";
static var productsApi = "${baseUrl}products/";
static var productsQuoteApi = "${baseUrl}ProductRequest";
static var commentsApi = "${baseUrl}comments?articleId=";
static var addCommentsApi = "${baseUrl}comments";



  // User Urls

  static var patientDataApi = "${baseUrl}patients/";
  static var patientSignUpApi = "${baseUrl}user/signup";
  static var videoSolutionsApi = "${baseUrl}VideoSolution";
  static var solutionsApi = "${baseUrl}solutions";
  static var bookingApi = "${baseUrl}bookings";
  static var bookingUpdateApi = "${baseUrl}booking/status";
  static var bookingRatingApi = "${baseUrl}booking/rating";
  static var bookingTimeSlotApi = "${baseUrl}booking/timeslot";
  static var filterTherapistApi = "${baseUrl}filter/therapist?";
  static var topTherapistApi = "${baseUrl}top/therapist";
  static var userBookingListApi = "${baseUrl}bookings?userId=";
  static var hashTagsListApi = "${baseUrl}hashtag/list";
  static var productRequestApi = "${baseUrl}ProductRequest";
  static var symptomsApi = "${baseUrl}symptoms";
  static var likeDislikeApi = "${baseUrl}like/article";
  static var shareApi = "${baseUrl}share/article";

  // Therapists Urls

static var therapistDataApi = "${baseUrl}therapists/";
  static var therapistBookingListApi = "${baseUrl}bookings?therapistId=";
  static var singleBookingApi = "${baseUrl}bookings/";

static var therapistRegisterApi = "${baseUrl}therapist/register";
static var therapistSolutionsApi = "${baseUrl}solutions?therapistId=";
static var therapistUploadSolutionsApi = "${baseUrl}solutions";
static var therapistDeleteSolutionsApi = "${baseUrl}solutions/";
static var therapistVideoSolutionsApi = "${baseUrl}VideoSolution?therapistId=";
static var therapistAddVideoSolutionsApi = "${baseUrl}VideoSolution";
static var therapistDeleteVideoSolutionsApi = "${baseUrl}VideoSolution/";
static var therapistDashBoardApi = "${baseUrl}therapist/dashboard?therapistId=";
static var deleteServiceApi = "${baseUrl}TherapistService/";
static var deleteTherapistSpecialityApi = "${baseUrl}TherapistSpeciality/";
static var updateTherapistApi = "${baseUrl}therapists/";
static var addtherapistEduApi = "${baseUrl}TherapistEducation";
static var notificationApi = "${baseUrl}notifications?";
static var requestServiceApi = "${baseUrl}services/add";

}
