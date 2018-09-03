require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:track) { tracks(:track_macau) }
  let(:car) { cars(:honda_jazz) }
  let(:max_speed_on_track) { track.max_speed(car) }
  let(:factor) do
    Track::DRIVING_TIME.select do |d_time|
      d_time === track.send(:hours_to_minutes, Time.zone.now.strftime("%H:%m") )
    end
  end

  describe "Surface factor" do

    context "shouldn't be nil" do
      it { expect(max_speed_on_track).not_to be_nil }
    end

    context "should get max_speed" do
      it { expect(max_speed_on_track.to_i).to be < car.max_speed }
    end

    context "should have km/h in result" do
      it { expect(max_speed_on_track).to match(/km\/h/) }
    end

    context "calculates slowing factor for surface" do
      it { expect(track.send(:slowing_factor_surface, car)).to eq 0.0 }
    end
  end

  describe "Time of the day factor" do
    context "calculates time on the day slowing factor" do
      it { expect(track.send(:slowing_factor_current_driving_time)).not_to be_nil }
    end

    context "calculates time of the day as CET timezone" do
      it { expect(track.send(:time_of_the_day)).to eq Time.now.in_time_zone(track.timezone).strftime("%H:%m") }
    end

    context "convert time to minutes" do
      it { expect(track.send(:hours_to_minutes, "20:00")).to eq 1200 }
    end
  end
end
