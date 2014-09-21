class ItemsController < ApplicationController
  before_action :project
  before_action :item, only: [:show, :edit, :update, :destroy, :changeOpened]
  before_action :set_items_list, only: [:index, :changeOpened]
  # GET /items
  # GET /items.json
  def index
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new(opened: true)
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @project.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to project_item_path(@project, @item), notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to project_item_path(@project, @item), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to project_items_url(@project) }
      format.json { head :no_content }
    end
  end

  def changeOpened
    @item.update_attributes(opened: !@item.opened)
    @items = Item.all
    respond_to do |format|
      format.js
    end
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def item
    @item ||= Item.find(params[:id])
  end

  def set_items_list
    @items_opened = @project.items.where(opened: true)
    @items_closed = @project.items.where(opened: false)
  end

  def item_params
    params.require(:item).permit(:description, :opened)
  end
end
