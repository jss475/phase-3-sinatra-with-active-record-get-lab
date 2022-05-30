class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries=Bakery.all

    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_good = BakedGood.order(price: :desc)
    baked_good.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.order(price: :desc).first
    most_expensive.to_json
  end

end
