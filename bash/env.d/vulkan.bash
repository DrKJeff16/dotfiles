[[ -d /usr/share/vulkan/icd.d ]] && VK_ICD_DIR=/usr/share/vulkan/icd.d

VK_DRIVER_FILES=""

if [[ -f "$VK_ICD_DIR/radeon_icd.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.json"
    elif ! [[ "$VK_DRIVER_FILES" =~ ^.*radeon_icd\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.json:$VK_DRIVER_FILES"
    fi
fi
if [[ -f "$VK_ICD_DIR/nvidia_icd.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.json"
    elif ! [[ "$VK_DRIVER_FILES" =~ ^.*nvidia_icd\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.json:$VK_DRIVER_FILES"
    fi
fi

export VK_DRIVER_FILES VK_ICD_DIR
