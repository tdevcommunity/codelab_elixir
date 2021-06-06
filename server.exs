get_pays_request = """
GET /pays HTTP/1.1
Host: server.com
User-Agent: Chrome/1.0
Accept: */*

"""

get_villes_request = """
GET /villes HTTP/1.1
Host: server.com
User-Agent: Chrome/1.0
Accept: */*

"""

non_existing_route_request = """
GET /non_existing_route HTTP/1.1
Host: server.com
User-Agent: Chrome/1.0
Accept: */*

"""

example_of_response = """
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 28

Lomé, Kpalimé, Dapaong, Kara
"""

defmodule Server do
  def handle(request) do
    request
    |> parse()
    |> route()
    |> format_response()
  end

  defp parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first()
      |> String.split(" ")

    %{method: method, path: path, resp_body: "", status: nil}
  end

  defp route(conv) do
    route(conv, conv.method, conv.path)
  end

  defp route(conv, "GET", "/villes") do
    %{ conv | status: 200, resp_body: "Lomé, Kpalimé, Dapaong, Kara" }
  end

  defp route(conv, "GET", "/pays") do
    %{ conv | status: 200, resp_body: "Togo, Benin, Ghana, Senegal" }
  end

  defp route(conv, _method, path) do
    %{ conv | status: 404, resp_body: "La page #{path} n'existe pas!"}
  end

  defp format_response(conv) do
    """
    HTTP/1.1 #{conv.status} #{status_reason(conv.status)}
    Content-Type: text/html
    Content-Length: #{String.length(conv.resp_body)}

    #{conv.resp_body}
    """
  end

  defp status_reason(code) do
    responses = %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }

    responses[code]
  end
end