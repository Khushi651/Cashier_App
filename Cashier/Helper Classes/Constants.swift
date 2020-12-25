import Foundation

struct Constant
{
    static let APP_NAME = "Pyramid VIP"
    
    static let GOOGLE_API_KEY = "AIzaSyABExzSywwh6q3jERGWCsFJcRVG9eYpZ6Y"
    
    static let BASE_URL = URLType.dev
    
    static let APP_STORE_LINK_URL = "itms-apps://itunes.apple.com/app/id1442838211"
    
    static let RAZOR_PAY_KEY = RAZOR_PAY_KEY_TYPE.TEST
    
    struct ZOHO_SALES_IQ {
        static let APP_KEY = "XhcaOn9Y6oLotZILgXlzfWXrpyfbj%2FhqypFtCoccqlMlraM1bLYJ1pdrWHf5z9Fj_in"
        static let ACCESS_KEY = "gw0JEu%2FGwRI%2FCSlrxEi7FV72bjx8JVAXhhD9futH4YwwC8GCZUh8%2FQhzo2GOv%2BR2tDbPPC%2FVHT89oypVjjXnmsUtImSWyiwpry%2Fyz1Vcq8WvitosHiQSmFn4wIITRcEQkuUNnviatiqIm81ZVGvSPIuevKRxkBiilrndmfMcohY%3D"
    }
    
    struct RAZOR_PAY_KEY_TYPE {
        static let LIVE = "rzp_live_oHEuuoVpNItaEH"
        static let TEST = "rzp_test_98xs2S8EA3rYLc"
    }
    
    struct PAYMENT_GATE_WAY {
        static let Paytm = "Paytm"
        static let Razorpay = "Razorpay"
    }
    
    struct PAYTM {
        static let MID = "LAPYRA39397814135444";
        static let TXNSTSTUSAPIURL = "https://securegw-stage.paytm.in/merchant-status/getTxnStatus";
        static let CHANNEL_ID = "WAP";
        static let WEBSITE = "WEBSTAGING";
        static let INDUSTRY_TYPE_ID = "Retail109";
        static let MERCHANT_KEY = "1G3PkKEm7pzc%#jg";
        static let MERCHANT_UNQ_REF = "Pyramid";
        static let CALLBACK_URL = "https://securegw-stage.paytm.in/theia/paytmCallback"
    }
    
    static let RAZOR_PAY_TEST_KEY = ""
    
	//MARK:- ****************************** VALIDATION CONSTANT  ************************************
	static let MESSAGE_BLANK_FIRSTNAME			= "kEnterFirstName".localized()
	static let MESSAGE_BLANK_LASTTNAME			= "kEnterLastName".localized()
    static let MESSAGE_BLANK_FULLNAME            = "KEnterFullName".localized()
	static let MESSAGE_BLANK_MOBNO				= "kEnterMobileNumber".localized()
    static let MESSAGE_VALID_MOBNO              = "kEnterValidMobileNumber".localized()
	static let MESSAGE_BLANK_EMAIL				= "kEnterEmail".localized()
    static let MESSAGE_VALID_EMAIL              = "kEnterValidEmail".localized()
	static let MESSAGE_BLANK_TITLE				= "kEnterTitle".localized()
    static let MESSAGE_BLANK_DOB                = "kSelectDOB".localized()
    static let MESSAGE_BLANK_GENDER             = "kSelectGender".localized()
    static let MESSAGE_BLANK_DATE_ANNIVERSARY   = "kSelectAnniversaryDate".localized()
    static let MESSAGE_BLANK_FIELD              =  "kFieldNotBlank".localized()
	static let MESSAGE_BLANK_PASSWORD	        =  "kEnterPassword".localized()
	static let MESSAGE_VALID_PASSWORD			=  "kValidPasswordLength".localized()
    static let MESSAGE_BLANK_PROMOCODE           =  "kEnterPromoCode".localized()
    static let MESSAGE_DIFFERENT_RESTAURANT      =  "kDifferentRestaurant".localized()
    static let MESSAGE_BLANK_COUPONCODE         =  "kEnterCouponCode".localized()
    static let MESSAGE_BLANK_AMOUNT           =  "Please enter amount"
    
    //MARK:- ***************************** MESSAGES CONSTANT*************************
    static let MESSAGE_INTERNET_LOST_TITLE   =   "kInternetConnectionLostTitle".localized()
    static let MESSAGE_INTERNET_LOST   =   "kInternetConnectionLost".localized()
    static let MESSAGE_CURRENTLY_WORKING_ON_IT   =   "Sorry, currently working on it."
    static let MESSAGE_CHOOSE_DELIVERY_ADDRESS   = "kChooseDeliveryAddress".localized()
	static let PAGESIZE=10
    
    struct EVENT_TYPE {
        static let PAST = "Past"
        static let UPCOMING = "upComing"
    }
	
    struct ORDER_HISTORY_TYPE {
        static let Live = "Live"
        static let History = "History"
    }
    
    static let DEVICE_TYPE = "IPHONE"
    
    
	//MARK:- ****************************** API NAME CONSTANT  ************************************
    static let kLOGIN						=	Constant.kApi + "login"
    static let kLoginUserByFacebook         =    Constant.kApi + "loginUserByFacebook"
    static let kGENERATE_OTP_FOR_USER       =   Constant.kApi + "generateOtpForUser"
    static let kLOGIN_USER_BY_OTP           =   Constant.kApi + "loginUserByOtp"
    static let kUPDATE_PROFILE              =   Constant.kApi + "updateProfile"
    static let kPROFILE_DETAIL              =   Constant.kApi + "profileDetail"
    static let kUPLOAD_FILE                 =   Constant.kApi + "uploadFile"
    static let kGET_EVENT_LIST              =   Constant.kApi + "getEventList"
	static let kLogOut						=	Constant.kApi + "logOut"
    static let kEVENT_DETAIL                =   Constant.kApi + "getEventDetail"
	static let kREDEEM_VOUCHER              =   Constant.kApi + "redeemVoucher"
    static let kGET_BALANCE                 =   Constant.kApi + "getBalance"
    static let kGET_SAVED_CARDS             =   Constant.kApi + "savedCardList"
    static let kRESTAURANT_LIST             =   Constant.kApi + "restaurantList"
    static let kItemList                    =   Constant.kApi + "itemList"
    static let kGetItemListWithCatSubCat    =   Constant.kApi + "getItemListWithCatSubCat"
    static let kSaveOrder                   =   Constant.kApi + "saveOrder"
    static let kOrderDetail                 =   Constant.kApi + "orderDetail"
    static let kUpdateOrderItemQuantity     =   Constant.kApi + "updateOrderItemQuantity"
    static let kCouponList                  =   Constant.kApi + "couponList"
    static let kApplyCoupon                 =   Constant.kApi + "applyCoupon"
    static let kRemoveCoupon                =   Constant.kApi + "removeCoupon"
    static let kGetAddressList              =   Constant.kApi + "getAddressList"
    static let kDeleteAddress               =   Constant.kApi + "deleteAddress"
    static let kSaveAddress                 =   Constant.kApi + "saveAddress"
    static let kUpdateAddress               =   Constant.kApi + "updateAddress"
    static let kSetLastPaymentMode          =   Constant.kApi + "setLastPaymentMode"
    static let kGetLastPaymentMode          =   Constant.kApi + "getLastPaymentMode"
    static let kPlaceOrder                  =   Constant.kApi + "placeOrder"
    static let kGET_DELIVERY_OFFER                  =   Constant.kApi + "getDeliveryOffer"
    static let kRateOrderByCustomer         =   Constant.kApi + "rateOrderByCustomer"
    static let kRateStealDealOrderByCustomer =   Constant.kApi + "rateStealDealOrderByCustomer"
    static let kScanQrCode                  =   Constant.kApi + "scanQrCode"
    static let kScanQrRewards               =   Constant.kApi + "scanQrReward"
    static let kGetAllCityList              =   Constant.kApi + "getAllCityList"
    static let kSaveReservation             =   Constant.kApi + "saveReservation"
    static let kGet_Version                 =   Constant.kApi + "getVersion/CustomerIosAppVersion"
    static let kRestaurantListInKeyValue    =   Constant.kApi + "restaurantListInKeyValue"
    static let kSaveFeedback                =   Constant.kApi + "saveFeedback"
    static let kGetOrderList                =   Constant.kApi + "getOrderList"
    static let kGeneratePaymentRequest      =   Constant.kApi + "generatePaymentRequest"
    static let kUpdateInstructionsOrder      =   Constant.kApi + "updateInstructionOnOrderItem"
    static let kVerifyPaytmTxnApi           =   Constant.kApi + "paytm/verifyTransaction"
    static let kUpdatePaymentRequest        =   Constant.kApi + "updatePaymentRequest"
    static let kReOrder                     =   Constant.kApi + "reOrder"
    static let kPayTipOnOrder               =   Constant.kApi + "payTipOnOrder"
    static let kPayTipOnStealDealOrder      =   Constant.kApi + "payTipOnStealDealOrder"
    static let kGetStealDealCategoryList    =   Constant.kApi + "getStealDealCategoryList"
    static let kGetStealDealItemList        =   Constant.kApi + "getStealDealItemList"
    static let kGetStealDealItemDetail      =   Constant.kApi + "getStealDealItemDetail"
    static let kGetNotificationList         =   Constant.kApi + "getNotificationList"
    static let kReserveStealDealItems        =   Constant.kApi + "reserveStealDealItems"
    static let kReserveStealDealItem        =   Constant.kApi + "reserveStealDealItem"
    static let kGenerateGiftCode            =   Constant.kApi + "generateGiftCode"
    static let kStealDealOrder              =   Constant.kApi + "stealDealOrder"
    static let kUpdateDeviceDetail          =   Constant.kApi + "updateDeviceDetail"
    static let kGetNotificationSetting      =   Constant.kApi + "getNotificationSetting"
    static let kSaveNotificationSetting     =   Constant.kApi + "saveNotificationSetting"
    static let kPaytmCheckSumGenerate       =   Constant.kApi + "paytm/pgRedirect/"
    static let kGetTopSellingItemList       =   Constant.kApi + "getTopSellingItemList"
    static let kGetWalletTransactionListData =   Constant.kApi + "getWalletTransactionListData"
    static let kGetATMMachineHistoryListData =   Constant.kApi + "getAtmMachineHistoryListData"
    static let kGetATMTxnHistoryListData =   Constant.kApi + "getRfidTransactionListData"
    
    static let kPayAtRestaurant             =   Constant.kApi + "payAtRestaurant"
    static let kApplyGiftCode             =   Constant.kApi + "applyGiftCode"
    static let kGetScratchCard             =   Constant.kApi + "getAllScratchCard"
    static let kScratchTheCard             =   Constant.kApi + "scratchTheCard"
    static let kGetStealDealRestaurantList         =   Constant.kApi + "getStealDealRestaurantList"
    
    static let kGetStealDealReservationItemList  =   Constant.kApi + "stealDealReservationItemList"
    
    static let kGetReservationRestaurantList =   Constant.kApi + "getReservationRestaurantList"
    static let kGET_ADBANNER_TOP_LIST    =   Constant.kApi + "getAdBannerList/DashboardTop"
    static let kGET_ADBANNER_BOTTOM_LIST    =   Constant.kApi + "getAdBannerList/DashboardBottom"
    static let kGetLastOrderWhichWasNotRated   =   Constant.kApi + "getLastOrderWhichWasNotRated"
    
    static let kGetTableReservationOccasionList                    =   Constant.kApi + "tableReservationOccasionList"
    
    private struct URLType {
        static let production = "https://pyramidcafe.com"
        static let live =  "http://15.206.119.146"
        static let dev = "http://13.234.184.132"
        static let local1 = "http://192.168.1.254:8084"
        static let local2 = "http://192.168.1.252:8084"
    }
    
    static let kApi = "/v1/api/"
    
    // Static page urls
    static let kAboutApp                    =   "/staticPage/AboutApp"
    static let kTermsAndCondition           =   "/staticPage/TermsAndCondition"
    static let kHelpAndSupport              =   "/staticPage/HelpAndSupport"
    
}
