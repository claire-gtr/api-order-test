class Api::OrdersController < ApplicationController
  def routing_result
    build_order
    render json: {"routing_result": "#{@order.supplier}"}
  end

  private

  def permitted_params
    params.permit!
  end

  def build_order
    @order = Order.create(
      acetate_id: permitted_params["id"],
      shipping_country: permitted_params["shipping_country"],
      line_sku: permitted_params["lines"].first["sku"],
      line_quantity: permitted_params["lines"].first["quantity"],
      line_prescription_type: permitted_params["lines"].first["prescription"]["type"],
      line_prescription_lens_color: permitted_params["lines"].first["prescription"]["lens_color"],
      line_prescription_left_sph: permitted_params["lines"].first["prescription"]["left"]["SPH"],
      line_prescription_right_sph: permitted_params["lines"].first["prescription"]["right"]["SPH"],
      )
  end
end
