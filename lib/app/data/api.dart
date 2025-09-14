class Api {
  /// base url

  static const baseUrl = "https://reqres.in/api";


  ///auth
  static const login = "$baseUrl/login"; //done


  ///Star Plans
  static const String starPlans = "$baseUrl/star-plans"; //done


  static String buyStarPlan(String starPlanId) => "$baseUrl/payments/create-session-for-star?starPlanId=$starPlanId"; //done

}
