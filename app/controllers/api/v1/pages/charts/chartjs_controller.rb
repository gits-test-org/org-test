class Api::V1::Pages::Charts::ChartjsController < Api::V1::ApplicaitonBaseController
  def area_chart
    @labels = ["January", "February", "March", "April", "May", "June", "July"]
    @datasets = [
      {
      label: "Electronics",
      fillColor: "rgba(210, 214, 222, 1)",
      strokeColor: "rgba(210, 214, 222, 1)",
      pointColor: "rgba(210, 214, 222, 1)",
      pointStrokeColor: "#c1c7d1",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(220,220,220,1)",
      data: [65, 59, 80, 81, 56, 55, 40]
      }
    ]
  end
end
