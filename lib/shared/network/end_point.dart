

//Address
const ADDRESSES = "Customer/Addresses";
const ADD_ADDRESSES = "Customer/AddressAdd";
const DELETEADDRESS = "Customer/AddressDelete/";
const EDIT_ADDRESS = "Customer/AddressEdit/";
const GET_STATES = "Country/GetStatesByCountryId/";
const SET_DEFAULT = "Customer/SetDefaultAddress";

//Customer information
const INFO = "Customer/Info";
const PASSWORD = "Customer/ChangePassword";
const LOGOUT = "Customer/logout";
const UPLOAD_PROFILE_IMAGE = "Customer/UploadAvatar";
const CHANGE_LANG = "Common/SetLanguage/";
const LANGUAGES = "Customer/GetAllLanguages";
const LOCALIZATION = "Common/GetAllResourceValues/";

const ADD_REVIEW = "Product/ProductReviewsAdd/";

//Order
const ORDERS = "Order/OrderList";
const VENDORS_ORDERS = "Order/OrderList";
//ShipmentList
const SHIPMENTS = "Order/ShipmentList";
const DELIVERIES = "Order/DeliveriesList";
const VENDORS_SHIPMENTS = "Order/ShipmentVendorList";
const SHIPMENT_DETAILS = "Order/ShipmentDetails/";
const TRACKING = 'Order/TrackingDetails?TrackingNumber=';

const TOPUP_ACCOUNT = 'SmartwareTopUpAccount/CustomerAccountList';
const TOPUP_CREATE = 'SmartwareTopUpAccount/Create';
const VENDOR_TOPUP_ACCOUNT = 'SmartwareTopUpAccount/VendorAccountList';
const TOPUP_BUSINESS_CREATE = 'SmartwareTopUpAccount/BusinessCreate';

//checkout
const ONE_PAGE_CHECKOUT = "Checkout/OnePageCheckout";
const OPC_SAVE_BILLING = "Checkout/OpcSaveBilling";
const OPC_SAVE_Shipping = "Checkout/OpcSaveShipping";
const OPC_SAVE_PAYMENT_INFO = "Checkout/OpcSavePaymentInfo";
const OPC_CONFIRM_ORDER = "Checkout/SmartwareOpcConfirmOrder";
const OPC_COMPLETE_ORDER = "Checkout/OpcCompleteRedirectionPayment";
const GET_API_KEYS = "PaymentStripe/GetApiKeys";

//products
const PRODUCTS = "Product/GetAllVendorProducts";
const WAREHOUSE = "Warehouse/GetAll";
const CREATE_WAREHOUSE="api-frontend/Warehouse/Create";
