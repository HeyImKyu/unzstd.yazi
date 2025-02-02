--- @sync entry

local function extract_zstd(url)
  if url:match("%.tar%.zst$") then
    os.execute("unzstd -fc " .. ya.quote(url) .. " | tar -xvf - " .. " >/dev/null 2>&1")
  else
    os.execute("unzstd -f " .. ya.quote(url) .. " >/dev/null 2>&1")
  end
end

local function is_zstd(mime)
  if string.match(mime, "application/zstd") then
    return true
  end
  return false
end

return {
  entry = function()
    local h = cx.active.current.hovered
    if h == nil then
     return
    end
    if is_zstd(h:mime()) then
     local path = extract_zstd(tostring(h.url))
    end
  end,
}
