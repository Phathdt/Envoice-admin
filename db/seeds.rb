admin = User.create(email: 'admin@envoice.com', password: '123456', name: 'admin', role: 2)
owner = User.create(email: 'owner@envoice.com', password: '123456', name: 'Owner name', role: 1)

company = owner.build_owner_company(
  name: 'TNHH Milo',
  legal_representative: 'Owner name',
  phone_number: '1234567890',
  tax_identification_number: '123456789098765432',
  address: '19A Cộng Hòa',
  email: 'milo@mail.com'
)

nem_account = Admin::AccountService.generate_account
account = company.build_account
account.private_key = nem_account.private_key
account.public_key = nem_account.public_key
account.address = nem_account.address
account.save
