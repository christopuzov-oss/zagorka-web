class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    styles: { s: { format: 'jpg', quality: 90, geometry: '380x380#',
                                       paperclip_optimizer: { allow_lossy: true } },
                              m: { format: 'jpg', quality: 90, geometry: '480x300#',
                                        paperclip_optimizer: { allow_lossy: true } },         
                              l: { format: 'jpg', quality: 90, geometry: '840x550#',
                                        paperclip_optimizer: { allow_lossy: true } },
                              xl: { format: 'jpg', quality: 90, geometry: '1920>',
                                        paperclip_optimizer: { allow_lossy: true } },
                              original: { animated: true, quality: 90, geometry: '' } }


  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 20.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:xl)
  end

  def url_thumb
    url(:s)
  end

  def picture_url(style = 'xl')
    picture.try(:data).try { url style }
  end
end
