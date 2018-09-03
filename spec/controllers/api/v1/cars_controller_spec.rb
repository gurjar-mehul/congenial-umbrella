require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body)['data']['car'] }
  let(:ford_figo) { cars(:ford_figo) }

  describe "GET #show" do
    describe 'without track params' do
      before { get :show, params: { id: ford_figo.slug } }

      context "returns http success" do
        it { expect(response).to have_http_status(:ok) }
      end

      context "returns with car slug" do
        it { expect(json["car_slug"]).to eq ford_figo.slug }
      end

      context "should show 'no track selected' if no track params specified" do
        it { expect(json["max_speed_on_track"]).to eq 'no track selected' }
      end
    end

    describe 'with params track' do
      before { get :show, params: { id: ford_figo.slug, :track => "nurburgring" } }
      context "max speed" do
        it { expect(json["max_speed_on_track"].to_i).to be < ford_figo.max_speed.to_i }
      end
    end
  end
end
