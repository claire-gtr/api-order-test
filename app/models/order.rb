class Order < ApplicationRecord
  has_many :lines
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
    result = []
    lines.each do |line|
      prescription = Prescription.find_by(line_id: line)
      if line.sku == "rimless-1"
        result << "LETHA"
      elsif prescription.right_sph.to_i < -6 || prescription.right_sph.to_i > 4 || prescription.left_sph.to_i < -6 || prescription.left_sph.to_i > 4
        result << "LETHA"
      elsif COMPANIES[:ATLENS][:"#{line.sku}"] < line.quantity.to_i
        result << "LETHA"
      else
        result << "ATLENS"
      end
    end
    if result.include?("LETHA")
      return "LETHA"
    else
      return "ATLENS"
    end
  end
end

