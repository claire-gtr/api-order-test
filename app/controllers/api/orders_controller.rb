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
      shipping_country: permitted_params["shipping_country"])
    permitted_params["lines"].each do |line|
      @line = Line.create(order_id: @order.id,
                  sku: line["sku"],
                  quantity: line["quantity"])
      Prescription.create(line_id: @line.id,
                          prescription_type: line["prescription"]["type"],
                          lens_color: line["prescription"]["lens_color"],
                          left_sph: line["prescription"]["left"]['sph'],
                          right_sph: line["prescription"]["right"]['sph'] )
    end
  end
end
