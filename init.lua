local selected_or_hovered = ya.sync(function()
  local tab, paths = cx.active, {}
  for _, u in pairs(tab.selected) do
    paths[#paths + 1] = tostring(u)
  end
  if #paths == 0 and tab.current.hovered then
    paths[1] = tostring(tab.current.hovered.url)
  end
  return paths
end)

local function extract_zstd(url)
  if url:match("%.tar.zst$") then
    os.execute("unzstd -fc " .. ya.quote(url) .. " | tar -xvf - " .. " >/dev/null 2>&1")
  else
    os.execute("unzstd -f " .. ya.quote(url) .. " >/dev/null 2>&1")
  end
end

return {
  entry = function()
    for i, url in pairs(selected_or_hovered()) do
      if url:match("%.zst$") then
        extract_zstd(url)
      end
    end
  end
}
