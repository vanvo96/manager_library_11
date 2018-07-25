module Admin::ApplicationHelper
  def edit_action edit_path
    content_tag :a,
      content_tag(:i, nil, class: ["zmdi", "zmdi-edit", "txt-warning"]),
      href: edit_path, class: "text-inverse pr-10",
      data: {toggle: :tooltip, original_title: t("edit")}
  end

  def delete_action delete_path
    content_tag :a,
      content_tag(:i, nil, class: ["zmdi", "zmdi-delete", "txt-danger"]),
      href: delete_path, class: "text-inverse pr-10",
      data: {toggle: :tooltip, original_title: t("delete"), method: :detete}
  end

  def add_action add_path
    content_tag :a, t("add"), href: add_path, class: "btn btn-success btn-anim"
  end
end
