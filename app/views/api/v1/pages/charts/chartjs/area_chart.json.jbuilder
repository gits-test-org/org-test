json.labels @labels
json.datasets do
json.array!(@datasets) do |dataset|
json.label dataset[:label]
json.fillColor dataset[:fillColor]
json.strokeColor dataset[:strokeColor]
json.pointColor dataset[:pointColor]
json.pointStrokeColor dataset[:pointStrokeColor]
json.pointHighlightFill dataset[:pointHighlightFill]
json.pointHighlightStroke dataset[:pointHighlightStroke]
json.data dataset[:data]
end
end
