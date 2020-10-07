class ImageRenderer
  def decode(layers)
    layers[0]
  end
  def combine_layers(top_layer,bottom_layer)
    new_layer = top_layer.dup.map(&:chars)
    new_bottom_layer = bottom_layer.dup.map(&:chars)
    i = 0
    j = 0
    while i < new_layer.length
      new_layer[i][j] = new_bottom_layer[i][j] if new_layer[i][j] == "2"
      j += 1
      if j == new_layer[i].length
        j = 0
        i += 1
      end
    end
    new_layer.map(&:join)

  end
end
