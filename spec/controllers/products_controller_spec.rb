# frozen_string_literal: true

RSpec.describe ProductsController, type: :request do
  before do
    create :product, name: 'The best product'
    create :product, name: 'Another good product'
  end

  it 'gets all products' do
    get '/'

    expect(response).to have_http_status(:ok)
    expect(response.body).to include('The best product')
    expect(response.body).to include('Another good product')
  end
end
