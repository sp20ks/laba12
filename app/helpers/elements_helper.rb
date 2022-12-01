module ElementsHelper
  def set_values
    @length = params[:length].to_i
    @str = params[:str_elem]
  end
  
  def check_data
    if /[^\d^\s]/.match(@str) then redirect_to adding_path, notice: "Sequence isn't correct"
    else
      @arr = @str.split.map!(&:to_i)
      redirect_to adding_path, notice: "Length isn't correct" if @arr.length != @length
    end
  end

  def largest_segment
    unless @seg_arr.length.zero?
      @max_subarr = @seg_arr[0]
      @seg_arr.each do |elem|
        @max_subarr = elem if @max_subarr.length < elem.length
      end
    end
  end
  
  def power_of_5?(num)
    tmp = 0
    return false if num.zero?

    while tmp.zero?
      tmp = num % 5
      num /= 5
    end
    if tmp.eql?(1) && num.zero? then true
    else
      false
    end
  end
  
  def segments_of_powers
    @seg_arr = []
    buf = []
    @arr.each do |elem|
      if power_of_5?(elem) then buf << elem
      elsif !buf.length.zero?
        @seg_arr << buf
        buf = []
      end
    end
    @seg_arr << buf unless buf.length.zero?
  end
end
