defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    find_bit_size(color_count, 1)
  end

  defp find_bit_size(color_count, n) do
    if Integer.pow(2, n) >= color_count do
      n
    else
      find_bit_size(color_count, n + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)

    case picture do
      <<value::size(size), _rest::bitstring>> -> value
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)

    case picture do
      <<_value::size(size), rest::bitstring>> -> rest
      _ -> <<>>
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
