class EricWeixin::Cms::Weixin::Xiaodian::OrdersController < EricWeixin::Cms::BaseController
  def index
    @orders = EricWeixin::Xiaodian::Order.order_query params
    @orders = @orders.order(order_create_time: :desc).paginate(per_page: params[:per_page]||10, page: params[:page]||1)
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
    file_name = EricWeixin::Xiaodian::Order.get_excel_of_orders params.permit(:start_date, :end_date, :deliver_status, :buyer_nick, :receiver_name, :receiver_mobile)
    send_file file_name
  end

  def update_hb_infos
    EricWeixin::RedpackOrder.delay(priority: 10).update_info_from_wx params[:public_account_id]
    flash[:success] = '已经将更新红包任务放到队列'
    redirect_to action: :index
  end

  def update_order_infos
    # 默认更新本月订单
    params[:start_date] ||= Time.now.beginning_of_month
    params[:end_date] ||= Time.now.end_of_month
    params[:start_date] = params[:start_date].to_date.change(hour:0,min:0,sec:0)
    params[:end_date] = params[:end_date].to_date.change(hour:23,min:59,sec:59)

    EricWeixin::Xiaodian::Order.delay(priority: 10).update_order_infos params[:start_date], params[:end_date]
    flash[:success] = '已经将更新订单信息的任务放到队列'
    redirect_to action: :index
  end

  def update_delivery_info_by_excel
    begin
      if params[:file].blank?
        flash[:alert] = '请先选择文件,再更新快递单信息'
        redirect_to action: :index
        return
      end
      flash[:success] = EricWeixin::Xiaodian::Order.update_delivery_info_by_excel params[:file]
      redirect_to action: :index
    rescue Exception=> e
      dispose_exception e
      flash[:alert] = get_notice_str
      redirect_to action: :index
    end
  end

end