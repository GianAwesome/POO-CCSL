class EventsController < ApplicationController
  skip_before_filter :set_current_user, only: [:calendar, :calendar_events, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_event_types, only: [:new, :edit, :create, :update]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  
  end

  # GET /events/1/edit
  def edit
  end

  def next 
    @event = Event.order(:time).first
  end

  def next3
    @events = Event.order(:time)[0..2]
  end
  
  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params.merge :user => current_user)
    if @event.save
      flash[:notice] = "Evento criado com sucesso."
      redirect_to event_path @event
    else
      flash[:warning] = @event.errors.full_messages
      render 'new'
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = 'Evento atualizado com sucesso.'
      redirect_to event_path @event
    else
      flash[:warning] = @event.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Evento apagado."
    redirect_to events_path
  end

  def calendar
  end

  def calendar_events
    @events = Event.all
    @events = @events.where("time >= ?", params[:start].to_datetime) if params[:start] != nil
    @events = @events.where("time <= ?", params[:end].to_datetime) if params[:end] != nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(id: params[:id])
      if(@event == nil)
        flash[:warning] = ["Este evento nao existe"]
        redirect_to events_path
      end
    end

    def set_event_types
      @event_types = EventType.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :summary, :time, :date, :place, :address, :speaker, :responsible, :performance, :url, :event_type_id, :image)
    end

    def check_user
      if current_user != @event.user
        redirect_to events_path
        flash[:notice] = "Voce nao possui direitos para acessar esse recurso"
      end
    end
end
