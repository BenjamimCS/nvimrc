local status_ok, Comment = pcall(require, "Comment")
if not status_ok then
  print("Comment is not installed")
  return
end

Comment.setup()
