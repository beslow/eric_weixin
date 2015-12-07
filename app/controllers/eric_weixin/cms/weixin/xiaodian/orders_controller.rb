class EricWeixin::Cms::Weixin::Xiaodian::OrdersController < EricWeixin::Cms::BaseController
  def index
    @orders = EricWeixin::Xiaodian::Order.all
    @orders = @orders.where("order_create_time >= ?", params[:start_date].to_time.change(hour:0,min:0,sec:0).to_i) unless params[:start_date].blank?
    @orders = @orders.where("order_create_time <= ?", params[:end_date].to_time.change(hour:23,min:59,sec:59).to_i) unless params[:end_date].blank?
    @orders = @orders.order(order_create_time: :desc).paginate(per_page: params[:per_page]||6, page: params[:page]||1)
  end

  def save_delivery_info
    begin
    order = EricWeixin::Xiaodian::Order.find_by_id(params[:id])
    if order.blank?
      render text: 'order的ID不正确。'
      return
    end
    options = {}
    options["delivery_company"] = params[:delivery_company]
    options["delivery_track_no"] = params[:delivery_track_no]
    options["need_delivery"] = params[:need_delivery].to_i
    options["is_others"] = params[:is_others].to_i
    result = order.set_delivery options
    render text: result ? '成功' : '失败'
    rescue Exception=>e
      dispose_exception e
      render text: "保存失败: #{get_notice_str}"
    end
  end

  def download_orders
    file_name = EricWeixin::Xiaodian::Order.get_excel_of_orders params.permit(:start_date, :end_date)
    send_file file_name
  end
end