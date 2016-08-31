class EventsController < ApplicationController
  Miro.options[:method] = 'histogram'
  Miro.options[:color_count] = 4
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    colors = Miro::DominantColors.new('http://localhost:3000/' + @event.image.thumb3.url)
    @colors = colors.to_hsl.sort {|a,b| b[2] <=> a[2]}

    @colors.each do |hsl|
      hsl[0] = (hsl[0]*360).to_s
      hsl[1] = (hsl[1]*100).to_s+"%"
      hsl[2] = (hsl[2]*100).to_s+"%"
    end

    @luminosity = 0

    @colors.each do |hsl|
      @luminosity += hsl[2].to_f
    end

    if @luminosity <= 100
      @bg_color = @colors[3]

      @secondary_color = []

      @bg_color.each do |x|
        @secondary_color.push(x)
      end

      @secondary_color[2] = (@secondary_color[2].to_f + 13).to_s + "%"

      @text_color = []
      text_color = @colors[0]

      text_color.each do |x|
        @text_color.push(x)
      end

      while @text_color[2].to_f - @bg_color[2].to_f <= 70 do
        @text_color[2] = (@text_color[2].to_f + 5).to_s + "%"
      end

    end

    if @luminosity >= 100
      @bg_color = @colors[0]

      @secondary_color = []

      @bg_color.each do |x|
        @secondary_color.push(x)
      end

      @secondary_color[2] = (@secondary_color[2].to_f + 10).to_s + "%"

      @text_color = []
      text_color = @colors[3]

      text_color.each do |x|
        @text_color.push(x)
      end
    end

    # while @secondary_color[2].to_f - @bg_color[2].to_f <= 10 do
    #   @secondary_color[2] = (@secondary_color[2].to_f + 5).to_s + "%"
    # end





  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :image, :background)
    end
end
