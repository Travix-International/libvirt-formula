{% from "libvirt/map.jinja" import map with context %}
include:
  - .install

libvirt.service:
  service.running:
    - name: {{ map.service }}
    - enable: True
    - watch:
      - pkg: libvirt.install

libvirt.guests_service:
{%- if map.guest_service_enable %}
  service.running:
{%- else %}
  service.stopped:
{%- endif %}
    - name: {{ map.guests_service }}
    - enable: {{ map.guest_service_enable }}
    - watch:
      - pkg: libvirt.install
