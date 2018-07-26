module Admin::ApplicationHelper
  def edit_action_tag edit_path
    content_tag :a,
      content_tag(:i, nil, class: ["zmdi", "zmdi-edit", "txt-warning"]),
      href: edit_path, class: "text-inverse pr-10",
      data: {toggle: :tooltip, original_title: t("edit")}
  end

  def delete_action_tag delete_path
    content_tag :a,
      content_tag(:i, nil, class: ["zmdi", "zmdi-delete", "txt-danger"]),
      href: delete_path, class: "text-inverse pr-10",
      data: {toggle: :tooltip, original_title: t("delete"), method: :delete,
             confirm: t("you_sure")}
  end

  def add_action_tag add_path
    content_tag :a, t("add"), href: add_path, class: "btn btn-success btn-anim"
  end
end
