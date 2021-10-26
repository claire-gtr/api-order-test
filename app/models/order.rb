class Order < ApplicationRecord
  COMPANIES = {
                  "ATLENS": {
                      "rimless-1": 20,
                      "metal-frame-1": 200,
                      "metal-frame-2": 0,
                      "acetate-frame-1": 1,
                      "acetate-frame-2": 10
                  },
                  "LETHA": {
                      "rimless-1": 20,
                      "metal-frame-1": 200,
                      "metal-frame-2": 200,
                      "acetate-frame-1": 100,
                      "acetate-frame-2": 100
                  }
                }

  def supplier
    if line_sku == "rimless-1"
      "LETHA"
    elsif line_prescription_right_sph.to_i < -6 || line_prescription_right_sph.to_i > 4 || line_prescription_left_sph.to_i < -6 || line_prescription_left_sph.to_i > 4
      "LETHA"
    elsif COMPANIES[:ATLENS][:"#{line_sku}"] < 1
      "LETHA"
    else
      "ATLENS"
    end
  end
end

