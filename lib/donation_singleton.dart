class DonationSingleton {
  static DonationSingleton _instance = null;
  factory DonationSingleton.singleton() {
    if(DonationSingleton._instance == null) {
      DonationSingleton._instance = DonationSingleton();
    }
    return DonationSingleton._instance;
  }
  
  DonationSingleton() {
    this.donationAmount = 100;
  }
  
  int donationAmount;
  // Methods, variables ...
}