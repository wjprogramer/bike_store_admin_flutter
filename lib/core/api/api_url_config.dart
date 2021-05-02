class ApiUrlConfig {

  ApiUrlConfig._();

  // region Common -------------------------------------------------------------
  static const staffLogin = '/staffLogin';
  // endregion Common

  // region Production ---------------------------------------------------------
  // ## Brand
  static const createBrand = '/';
  static const brand = '/brand';
  static const brands = '/brands';
  static const updateBrand = '/brand/update';
  static const deleteBrand = '/brand/delete';
  // ## Category
  static const createCategory = '/';
  static const category = '/category';
  static const categories = '/categories';
  static const updateCategory = '/category/update';
  static const deleteCategory = '/category/delete';
  // ## Product
  static const createProduct = '/';
  static const product = '/product';
  static const products = '/products';
  static const updateProduct = '/product/update';
  static const deleteProduct = '/product/delete';
  // ## Stock
  static const createStock = '/';
  static const stock = '/stock';
  static const stocks = '/stocks';
  static const updateStock = '/stock/update';
  static const deleteStock = '/stock/delete';
  // endregion Production

  // region Sales --------------------------------------------------------------
  // ## Store
  static const createStore = '/';
  static const store = '/store';
  static const stores = '/stores';
  static const updateStore = '/store/update';
  static const deleteStore = '/store/delete';
  // ## Staff
  static const createStaff = '/';
  static const staff = '/staff';
  static const staffs = '/staffs';
  static const updateStaff = '/staff/update';
  static const deleteStaff = '/staff/delete';
  // ## Customer
  static const createCustomer = '/';
  static const customer = '/customer';
  static const customers = '/customers';
  static const updateCustomer = '/customer/update';
  static const deleteCustomer = '/customer/delete';
  // ## Order
  static const createOrder = '/';
  static const order = '/order';
  static const orders = '/orders';
  static const updateOrder = '/order/update';
  static const deleteOrder = '/order/delete';
  // endregion Sales

}