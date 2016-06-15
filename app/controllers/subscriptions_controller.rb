class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new member: Member.find_by(id: params['member_id'])
  end

  def create
    @subscription = Subscription.new member: Member.find_by(id: params['member_id'])
    @subscription.update subscription_params
    if @subscription.save
      redirect_to @subscription.member
    else
      render :new
    end
  end

  def edit
    @subscription = Subscription.find_by! member: Member.find_by(id: params['member_id']), id: params['id']
  end

  def update
    @subscription = Subscription.find_by! member: Member.find_by(id: params['member_id']), id: params['id']
    @subscription.update subscription_params
    if @subscription.save
      redirect_to @subscription.member
    else
      render :edit
    end
  end

  def destroy
    @subscription = Subscription.find_by! member: Member.find_by(id: params['member_id']), id: params['id']
    @subscription.delete
    redirect_to @subscription.member
  end

  private

  def subscription_params
    params.fetch('subscription',[]).permit(:method, :membership_ids=>[])
  end
end
